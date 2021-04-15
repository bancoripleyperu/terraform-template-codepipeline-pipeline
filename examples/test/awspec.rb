require 'awspec'
require 'aws-sdk'

service_bucket = `cd examples/test/ && terraform output bucket`.strip.delete('"')
service_codebuild = `cd examples/test/ && terraform output codebuild`.strip.delete('"')
service_role = `cd examples/test/ && terraform output role`.strip.delete('"')

describe s3_bucket(service_bucket.to_s) do
    it { should exist }
end

describe codebuild(service_codebuild.to_s) do
    it { should exist }
end

describe iam_role(service_role.to_s) do
    it { should exist }
end