<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<head>
<style>
body{
    background: -webkit-linear-gradient(left,  #000000, #e5474b);
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}</style></head>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<4!------ Include the above in your HEAD tag ---------->


<div class="container emp-profile">

            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src=data:image/png;base64,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 alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
               <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                    Murali
                                    </h5>
  
                                    <h6>
                                        Employee 
                                    </h6>
                                                               <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Go Back"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>WORK LINK</p>
                            <a href="">Website Link</a><br/>
                            <a href="">Bootsnipp Profile</a><br/>
                            <a href="">Bootply Profile</a>
                            <p>SKILLS</p>
                            <a href="">Web Designer</a><br/>
                            <a href="">Web Developer</a><br/>
                            <a href="">WordPress</a><br/>
                            <a href="">WooCommerce</a><br/>
                            <a href="">PHP, .Net</a><br/>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Murali</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Murali</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
  3                                          </div>
                                            <div class="col-md-6">
                                                <p>murali@gmail.com</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>9003279945</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Employee</p>
                                            </div>
                                        </div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Experience</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Hourly Rate</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$/hr</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Total Projects</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>English Level</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Availability</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>

       