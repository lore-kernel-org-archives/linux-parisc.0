Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B9CE482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Dec 2001 11:09:57 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 16F4FB00C; Thu, 20 Dec 2001 18:08:40 +0000 (GMT)
Date: Thu, 20 Dec 2001 18:08:40 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] StiFB-Problems
Message-ID: <20011220180840.M1897@linuxcare.com>
References: <3C1D0565.3000805@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3C1D0565.3000805@hrzpub.tu-darmstadt.de>; from rscholz@hrzpub.tu-darmstadt.de on Sun, Dec 16, 2001 at 09:34:45PM +0100
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

On Sun, Dec 16, 2001 at 09:34:45PM +0100, Rüdiger Scholz wrote:
> Another problem : Using mpg321 from the 0.9.3 release gives me  the 
> failure "Illegal instruction". Glibc-Version is 2.2.4-7. The stack dump 
> is in the attached boot.log-file.

You need a rebuilt libaudiofile0 deb to fix that, should be in the
archive in a day or two, thanks to tausq.

Richard
