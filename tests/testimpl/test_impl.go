package common

import (
	"context"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/appmesh"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/require"
)

func TestAppmeshRoute(t *testing.T, ctx types.TestContext) {
	appmeshClient := appmesh.NewFromConfig(GetAWSConfig(t))
	routeName := terraform.Output(t, ctx.TerratestTerraformOptions(), "name")
	meshName := terraform.Output(t, ctx.TerratestTerraformOptions(), "mesh_name")
	routerName := terraform.Output(t, ctx.TerratestTerraformOptions(), "virtual_router_name")

	output, err := appmeshClient.DescribeRoute(context.TODO(), &appmesh.DescribeRouteInput{
		MeshName:          &meshName,
		VirtualRouterName: &routerName,
		RouteName:         &routeName,
	})
	if err != nil {
		t.Errorf("Error describing route: %v", err)
	}

	virtualRoute := output.Route

	t.Run("TestDoesNodeExist", func(t *testing.T) {
		require.Equal(t, "ACTIVE", string(virtualRoute.Status.Status), "Expected status to be ACTIVE, but got %s", string(virtualRoute.Status.Status))
	})
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}
