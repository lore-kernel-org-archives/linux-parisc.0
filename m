Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70C99482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Nov 2001 15:18:52 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id DA4BBB00C; Mon,  5 Nov 2001 22:20:02 +0000 (GMT)
Date: Mon, 5 Nov 2001 22:20:02 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] include - haeder files missing
Message-ID: <20011105222002.I8938@linuxcare.com>
References: <3BE70974.A7EB0181@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BE70974.A7EB0181@gmx.at>; from christoph.plattner@gmx.at on Mon, Nov 05, 2001 at 10:49:40PM +0100
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

On Mon, Nov 05, 2001 at 10:49:40PM +0100, Christoph Plattner wrote:
> Hello !
> 
> I have the problem that I miss most of the header files under
> /usr/include
> or /usr/X11R6/include/X11 ?
> 
> Which binary packages I have to install (name of the packages).
> I miss the default glibc-2 headers, the X11 headers, etc...
> 
> I cannot find out, which packages the h-files include. It is quite a
> long
> time to build and install glibc by myself on the 712/60, and it is much
> too
> long to build a Xfree on myself ...

For glibc headers, you need libc6-dev.

For X headers, basic ones are in xlibs-dev, at least.

Richard
