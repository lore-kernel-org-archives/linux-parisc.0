Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f272.law10.hotmail.com [64.4.14.147])
	by dsl2.external.hp.com (Postfix) with ESMTP id 673884837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 10:20:00 -0700 (MST)
From: "Derek Armstrong" <armstrong_derek@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 27 Dec 2001 11:19:58 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F272OJlN0hju8qNABIT0000d6c2@hotmail.com>
Subject: [parisc-linux] Re: XFree86 Question
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>Date: Wed, 26 Dec 2001 13:51:17 -0800
>To: bheadley@interaccess.com
>From: Christian Suder <csuder@cisco.com>
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] Re: XFree86 Question
>
>
>In case you still have the problem, if I remember correctly the reason >is 
>that the XFree config file is generated in a "PC-ish" manner with a >lot of 
>different screen definitions and tries to start X in a >combination the fb 
>device does not support. Edit it to have just an >entry for the type of 
>screen you have (likely 1280x1024, 8bit).
>
>	Christian

I was having the same problem on a B132L+.  This fix got me up and going.  
Thanx Christian!



_________________________________________________________________
Join the world’s largest e-mail service with MSN Hotmail. 
http://www.hotmail.com
