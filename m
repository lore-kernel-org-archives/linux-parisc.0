Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 295DC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 02:22:13 -0600 (MDT)
Message-Id: <200110050818.KAA00431@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Neulinger, Nathan" <nneul@umr.edu>,
	"'John Marvin'" <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP-UX binary compatibility
Date: Fri, 5 Oct 2001 10:17:53 +0200
Cc: "Uetrecht, Daniel J." <uetrecht@umr.edu>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D85B@umr-mail03.cc.umr.edu>
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D85B@umr-mail03.cc.umr.edu>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

Hi Nathan,

On Thursday 04 October 2001 17:07, Neulinger, Nathan wrote:
>
> troot-halley(11)> uname -a
> HP-UX halley B.10.20 A 9000/735 2002000004 two-user license
> troot-halley(12)> uname -i
> 2002000004
>
> It's that 2002000004 that I need. 

I currently don't have access to a parisc-linux machine, but out of 
my head I think you may get that number from the /proc/cpuinfo file 
(maybe it is displayed there in hex) and may use it from the variable
behind this output for your syscall wrapper.

Greetings,
Helge
