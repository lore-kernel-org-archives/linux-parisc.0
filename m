Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust111.brnt.cable.ntl.com [213.107.179.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34B544830
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 03:55:55 -0700 (MST)
Date: Mon, 2 Dec 2002 10:50:23 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Tim Kemna <t.kemna@student.utwente.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] lifimage
Message-ID: <20021202105023.GL24337@sleepie.demon.co.uk>
References: <3DA3DE6600007D28@ocpmta4.be.tiscali.com> <003101c299e1$9b2e7680$4fe85982@kabel.utwente.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <003101c299e1$9b2e7680$4fe85982@kabel.utwente.nl>
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

On Mon, Dec 02, 2002 at 10:02:56AM +0100, Tim Kemna wrote:
> The HOWTO only says how to make a lifimage (with NFSROOT or RAMDISK). It
> doesn't say how I should use it.

You can netboot it, or use dd to dump it to a spare scsi disk and boot
that disk, or write it to a cd (just the lifimage itself, not as a file
in a file system), and boot from that.  Personally I'd netboot it.

Richard
