Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DC1E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 11:53:56 -0600 (MDT)
Date: Mon, 15 Apr 2002 18:35:44 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <helge.deller@sap.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem and power button
Message-ID: <20020415173544.GO4971@sleepie.demon.co.uk>
References: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com> <200204151232.46311.helge.deller@sap.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200204151232.46311.helge.deller@sap.com>
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

On Mon, Apr 15, 2002 at 12:32:46PM +0200, Helge Deller wrote:
> Older kernels just didn't reported it, but all had this problem.
> We're not freeing the memory yet, since we still have one or more 
> __init or __initdata too much in our kernel. Just ignore it for now.

Do you recall what config failed when we did try to free the memory?  I
tested recently with B180 and A500, both worked fine with freeing of
memory enabled.  IIRC the origianl problem was that init crashed on
boot...

Cheers,
  Richard
