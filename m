Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 0A3A24835
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Jun 2002 03:07:49 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: James Mcclain <jmccla3@gl.umbc.edu>, "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] 0.9.3 Audio on C110
Date: Sat, 22 Jun 2002 11:06:11 +0200
Cc: Patrick Caulfield <patrick@tykepenguin.com>,
	<parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.31L.02.0206212008460.5960-100000@linux2.gl.umbc.edu>
In-Reply-To: <Pine.LNX.4.31L.02.0206212008460.5960-100000@linux2.gl.umbc.edu>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200206221106.11065.deller@gmx.de>
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

On Saturday 22 June 2002 02:11, James Mcclain wrote:
> i cannot speak to the mixer and gain issues, but i can offer something
> with regard to recording:  adding lines:
>
> 	case SNDCTL_DSP_SYNC:
> 	return 0;
>
> to the ioctl swith statment in drivers/sound/harmony.c (line 727 or there
> abouts) will allow you to use sox to record (i have been able to
> succesfully record using sox after adding this change).

FYI, I've added this patch to the 2.4.18-pa40 CVS kernel.

Helge
