Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 81C85482A
	for <parisc-linux@parisc-linux.org>; Thu, 20 Dec 2001 16:13:45 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Richard Hirst <rhirst@linuxcare.com>,
	Tommi Aihkisalo <tommi.aihkisalo@vtt.fi>
Subject: Re: [parisc-linux] Network bootproblem with 712/80
Date: Thu, 20 Dec 2001 21:10:58 +0100
Cc: parisc <parisc-linux@parisc-linux.org>
References: <1008318270.3c19b73ecfadb@nyepost.start.no> <000b01c184a9$3f00a1b0$7862bc82@ele.vtt.fi> <20011220151554.L1897@linuxcare.com>
In-Reply-To: <20011220151554.L1897@linuxcare.com>
MIME-Version: 1.0
Message-Id: <20011220231345.81C85482A@dsl2.external.hp.com>
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

On Thursday 20 December 2001 16:15, Richard Hirst wrote:
> On Fri, Dec 14, 2001 at 04:11:37PM +0200, Tommi Aihkisalo wrote:
> > Hello all!
> >
> > I am having a problem with my 712/80 when booting with bootp/tftp. With
> > some effort I got it requesting kernel image (lifimage) over the network.
> > The download starts but almost the same time it ends and it retries it
> > over and over again. With Weird-solution's bootp and tftp server I can
> > see that the download starts many times but all of them results error.
> > When using the RedHat's bootp/tftp, the tcpdump shows (what I have
> > understood from the output) that the HP is querying a file of name '.'
> > (dot), this is quite strange...

Hi Tommi,

did you tried the newest versions of tftp-server on RH ?
AFAIR the tftp-servers in 7.0 and 7.1 were broken and I fixed them 
during my time at RedHat.

Greetings,
Helge
