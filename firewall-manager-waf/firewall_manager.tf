resource "aws_fms_policy" "wafv2_main_rules" {
  name                  = "FMS-POLICY"
  exclude_resource_tags = false
  remediation_enabled   = false
  resource_type         = "AWS::ElasticLoadBalancingV2::LoadBalancer"

  exclude_map {
    account = ["00000000000"]
  }

  security_service_policy_data {
    type = "WAFV2"

    managed_service_data = jsonencode({
      type = "WAFV2",
      preProcessRuleGroups = [
        {
          "managedRuleGroupIdentifier" : {
            "vendorName" : "AWS",
            "managedRuleGroupName" : "AWSManagedRulesLinuxRuleSet",
            "version" : null
          },
          "overrideAction" : { "type" : "NONE" },
          "ruleGroupArn" : null,
          "excludeRules" : [],
          "ruleGroupType" : "ManagedRuleGroup"
        },
        {
          "managedRuleGroupIdentifier" : {
            "vendorName" : "AWS",
            "managedRuleGroupName" : "AWSManagedRulesAdminProtectionRuleSet",
            "version" : null
          },
          "overrideAction" : { "type" : "NONE" },
          "ruleGroupArn" : null,
          "excludeRules" : [],
          "ruleGroupType" : "ManagedRuleGroup"
        }
      ]
      defaultAction = {
        type = "ALLOW"
      }
      overrideCustomerWebACLAssociation = false
    })
  }
  tags = local.tags
}