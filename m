Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id C95DC482A
	for <parisc-linux@parisc-linux.org>; Thu, 20 Dec 2001 08:17:10 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id EDABDB00C; Thu, 20 Dec 2001 15:15:54 +0000 (GMT)
Date: Thu, 20 Dec 2001 15:15:54 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Tommi Aihkisalo <tommi.aihkisalo@vtt.fi>
Cc: parisc <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Network bootproblem with 712/80
Message-ID: <20011220151554.L1897@linuxcare.com>
References: <1008318270.3c19b73ecfadb@nyepost.start.no> <000b01c184a9$3f00a1b0$7862bc82@ele.vtt.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000b01c184a9$3f00a1b0$7862bc82@ele.vtt.fi>; from tommi.aihkisalo@vtt.fi on Fri, Dec 14, 2001 at 04:11:37PM +0200
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

On Fri, Dec 14, 2001 at 04:11:37PM +0200, Tommi Aihkisalo wrote:
> Hello all!
> 
> I am having a problem with my 712/80 when booting with bootp/tftp. With some
> effort I got it requesting kernel image (lifimage) over the network. The
> download starts but almost the same time it ends and it retries it over and
> over again. With Weird-solution's bootp and tftp server I can see that the
> download starts many times but all of them results error. When using the
> RedHat's bootp/tftp, the tcpdump shows (what I have understood from the
> output) that the HP is querying a file of name '.' (dot), this is quite
> strange...
> 
> Have I understood correctly that the lifimage (from the 0.9.3 installation
> cd) is the correct kernel image?

Sorry for the slow response.  I just tried netbooting a 712 using the
lifimage on the 0.9.3 ISO (dists/woody/main/disks-hppa/current/lifimage),
and it booted fine.  The palo command line does say 0/linux, while the
lifimage contains linux32 and linux64 (or similar), but that is not a
problem - palo figures out that it is on a 32 bit box and selects the
32 bit kernel correctly.  I was using a Mandrake box as bootp/tftp server.

Richard
