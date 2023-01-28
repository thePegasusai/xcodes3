import AWSS3

let credentialsProvider = AWSStaticCredentialsProvider(accessKey: "YOUR_ACCESS_KEY", secretKey: "YOUR_SECRET_KEY")
let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)

AWSS3.register(with: configuration, forKey: "USWest2S3")

let s3 = AWSS3.S3(forKey: "USWest2S3")

let listRequest = AWSS3ListObjectsRequest()
listRequest?.bucket = "YOUR_BUCKET_NAME"

s3.listObjects(listRequest).continueWith { (task) -> AnyObject? in
    if let error = task.error {
        print("Error occurred: \(error)")
        return nil
    }

    if let result = task.result {
        print("Objects in bucket: \(result.contents)")
    }

    return nil
}
