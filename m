Return-Path: <hppa-linux@puffingroup.com>
Date: Wed, 10 Feb 1999 09:44:40 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902101744.JAA19818@gatekeeper.equator.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] General port design questions
Resent-Message-ID: <"bF_4q2.0.od2.51Ums"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


>
> When we get to the point where we can start working on the kernel,
> which system call interface should we chose?  Do we go the LinuxAlpha
> port route and try to maintain compatibility with HP-UX
> structures/system calls as much as possible so a compatibility layer
> becomes easier, or do we leverage the work already done by the MkLinux

 
   My vote is to not worry about HP-UX compatibility. Others will probably
   think differently. To me, the idea of having Linux on my system is
   to avoid using HP-UX, which has become bulky, buggy, and inefficient.

   I suppose the decision for others will be based on the importance of
   their legacy HP-UX apps. I am more interested in the freely
   available open source applications that I can build and fix myself.

   Regards, Jason.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
