Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe60.law4.hotmail.com [216.33.148.156])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26349482A
	for <parisc-linux@parisc-linux.org>; Sat, 12 Jan 2002 04:36:57 -0700 (MST)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Peter Lavender" <plaven@bigpond.net.au>,
	"parisc" <parisc-linux@parisc-linux.org>
References: <005601c19b59$d9645370$090ba8c0@winnie>
Subject: Re: [parisc-linux] bogomips?
Date: Sat, 12 Jan 2002 12:35:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE60SJBsBrwvvIfPvhi000088a7@hotmail.com>
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

Hmm, don't know. 

My little 486DX4 100MHz, 12MB RAM:
/proc# cat ./cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 4
model           : 8
model name      : 486 DX/4
stepping        : 0
fdiv_bug        : no
hlt_bug         : no
sep_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme
bogomips        : 49.66

/proc# 


regards,

Kenneth

----- Original Message ----- 
From: "Peter Lavender" <plaven@bigpond.net.au>
To: "parisc" <parisc-linux@parisc-linux.org>
Sent: Saturday, January 12, 2002 12:10 PM
Subject: [parisc-linux] bogomips?


> Hi everyone,
> 
> What's a 715/64 equate to in terms of intel arches?
> 
> Here's my p90 with 48meg of ram:
> Calibrating delay loop... 35.84 BogoMIPS
> 
> and my 715/64 with 128 meg of ram:
> Calibrating delay loop... 63.69 BogoMIPS
> 
> Thanks,
> 
> Pete
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
