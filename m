Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cactus.bheadley.org (d52.focal4.interaccess.com [207.208.139.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id 343A3482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 15:57:19 -0700 (MST)
Message-ID: <3C2E4A12.8090806@interaccess.com>
Date: Sat, 29 Dec 2001 16:56:18 -0600
From: "Bryan W. Headley" <bheadley@interaccess.com>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PARISC-Linux 0.9.3 on a 735
References: <3C2C9C6E.D63903A7@cms-stl.com> <20011229211132.GB11344@sleepie.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Richard Hirst wrote:

> On Fri, Dec 28, 2001 at 10:23:10AM -0600, Michael Madden wrote:
> 
>>Hello;
>>
>>I recently installed PARISC-Linux 0.9.3 on an older 735, and I'm having
>>a heck of time to get X configured.  I have a HIL keyboard and mouse,
>>but /usr/bin/X11/xf86config presents you with options for common
>>pc setups (PS2 mouse, ATI video card, etc).  Is there a better way
>>to setup X or is this even supported at this time?
>>
> 
> Have you followed the advice in
> 
> <http://www.parisc-linux.org/release-0.9/errata-093.html>
> 


Probably should ammend the release doc to suggest running fbset -i (as 
root) is useful to get the resolution information as well...





-- 
____               .:.                 ____
Bryan W. Headley - bheadley@interaccess.com
