Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id A68A1482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 04:32:48 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Kenneth Westelinck" <kennywest1@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem and power button
Date: Mon, 15 Apr 2002 12:32:46 +0200
References: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com>
In-Reply-To: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com>
MIME-Version: 1.0
Message-Id: <200204151232.46311.helge.deller@sap.com>
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

On Monday 15 April 2002 10:41, Kenneth Westelinck wrote:
> - When booting the kernel reports: NOT FREEING INITMEM. I found this in the
> mailing list, but I couldn't find a solution. Is there any solution for
> this problem? I don't think I had this when running the old kernel.

Older kernels just didn't reported it, but all had this problem.
We're not freeing the memory yet, since we still have one or more 
__init or __initdata too much in our kernel. Just ignore it for now.

> - Second, when I push the power button, the system powers off without doing
> a clean shutdown. When running the 2.4.9 kernel the machine didn't halt
> when pushing this button. Only typing in "shutdown -h now" did the trick. I
> prefer this behaviour. In this case a normal user cannot shutdown the
> machine, except by pulling the power cord. Can someone please tell me which
> file to edit/tweak to give back this old behaviour?

The power-button should work if you update to a newer kernel (>= 2.4.18-pa19).

Helge
