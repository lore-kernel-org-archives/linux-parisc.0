Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85AA74829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 12:04:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18BgL1-0002Ku-00; Tue, 12 Nov 2002 19:04:39 +0000
Date: Tue, 12 Nov 2002 19:04:39 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] rtc doesn't build
Message-ID: <20021112190439.B30392@parcelfarce.linux.theplanet.co.uk>
References: <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net>; from bzeeb-lists@lists.zabbadoz.net on Tue, Nov 12, 2002 at 06:57:07PM +0000
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

On Tue, Nov 12, 2002 at 06:57:07PM +0000, Bjoern A. Zeeb wrote:
> Hi,
> 
> 
> thi sseems to be a problem with nonexistent defines expected
> to be in include/asm-parisc/mc146818rtc.h

Say 'N' to "Enhanced Real Time Clock Support", then "Y" to "Generic
/dev/rtc emulation" instead.

-- 
Revolutions do not require corporate support.
