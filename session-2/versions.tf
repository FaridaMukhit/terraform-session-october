terraform {
    required_version = "~> 1.3.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.33.0"
        }
    }
}

// 1 = major # feature = upgrade
// 3 = minor # enhancements = update
// 2 = patch # vulnerabilities = patching 

// ~> = lazy constraints
// ~> 1.3.0 = 1.3.0 - 1.3.x
// 1.3.0 <= 1.3.x < 1.4.0

// ~> 4.33.0 = 4.33.0 - 4.33.x
// 4.33.0 <= 4.33.0 < 4.34.0