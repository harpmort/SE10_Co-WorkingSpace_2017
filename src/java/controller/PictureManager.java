/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.File;
import java.io.IOException;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class PictureManager {
    String bucketName = "coworkingspacebucket";
    AmazonS3 s3client = new AmazonS3Client(new ProfileCredentialsProvider());
    public String savePicture(String destination, String filename, String filetype, String filepath) throws IOException{
        String destinationName = destination + "/" + filename + "." + filetype;
        
        try {
            System.out.println("Uploading a new object to S3 from a file\n");
            File file = new File(filepath);
            s3client.putObject(new PutObjectRequest(
            		                 bucketName, destinationName, file).withCannedAcl(CannedAccessControlList.PublicRead));

         } catch (AmazonServiceException ase) {
            System.out.println("Caught an AmazonServiceException, which " +
            		"means your request made it " +
                    "to Amazon S3, but was rejected with an error response" +
                    " for some reason.");
            System.out.println("Error Message:    " + ase.getMessage());
            System.out.println("HTTP Status Code: " + ase.getStatusCode());
            System.out.println("AWS Error Code:   " + ase.getErrorCode());
            System.out.println("Error Type:       " + ase.getErrorType());
            System.out.println("Request ID:       " + ase.getRequestId());
        } catch (AmazonClientException ace) {
            System.out.println("Caught an AmazonClientException, which " +
            		"means the client encountered " +
                    "an internal error while trying to " +
                    "communicate with S3, " +
                    "such as not being able to access the network.");
            System.out.println("Error Message: " + ace.getMessage());
        }
        String url_link = getUrlImage(destination, filename, filetype);
        System.out.println(url_link);
        return url_link;
    }
    public String getUrlImage(String destination, String filename, String filetype){
        String url_link = "https://coworkingspacebucket.s3.amazonaws.com/" + destination + "/" + filename + "." + filetype;
        return url_link;
    }
    
}
