Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.xaire.com (unknown [200.47.131.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33E9C482A
	for <parisc-linux@parisc-linux.org>; Thu, 10 May 2001 06:58:28 -0600 (MDT)
Received: from diana (agencia.cordoba.xaire.com [200.47.58.235])
	by mail.xaire.com (Postfix) with SMTP id 516734231
	for <parisc-linux@parisc-linux.org>; Thu, 10 May 2001 09:35:21 +0000 (GMT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charlie Navarro <charlie_navarro@yahoo.com>
To: parisc-linux@parisc-linux.org
Date: Thu, 10 May 2001 09:53:02 -0300
MIME-Version: 1.0
Message-Id: <01051009530200.01761@diana>
Subject: [parisc-linux] Problems with debian instalation
List-ID: <linux-parisc.vger.kernel.org>

Hello,

first, I want to send a big congratulation to the people that works porting 
Linux to my HP 712/60. If I said: it a good job!!!!, they are a small words. 
The english does not my mother lenguaje.

Ok, I have a question.

I installed my 712/60 from palinux-0.6-32STI.iso and all OK. I had some 
poblems with the keyboard (some sequence of key in vi, in some case fell down 
the system) btw my problem is the debian dependences.

I made a "apt-get dselect-upgrade" with out problems, with the original 
sources.list that it came in the iso.
Now I have the dependences problems to install gcc. cpp depends of cpp-3.0 
but it is not installable. xbase-clients depends of cpp.

Ok, I want to run X, but I can not. I want to compile X but I don't have the 
gcc. I know the step to make a compiler, 
http://mkhppa1.esiee.fr/en/compile.html is easy to follow. 
Are another site to download the deb, and the correct dependences?

Thank in advance

Charlie
