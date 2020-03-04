Feature: security_group

    In order to ensure the security group is secure:

    Scenario: Only selected ports should be publicly open
        Given I have AWS Security Group defined
        When it contains ingress
        Then it must only have tcp protocol and port 22,443 for 0.0.0.0/0