Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 688454829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 10:01:07 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h3GF31RN030226;
	Wed, 16 Apr 2003 16:03:01 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h3GF2xMX030224;
	Wed, 16 Apr 2003 16:02:59 +0100
Subject: Re: [parisc-linux] Re: Presicionbook success
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Gavin Hubbard <ghub005@xtra.co.nz>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3.0.2.32.20030417011531.00a2bf20@pop3.xtra.co.nz>
References: <3.0.2.32.20030417011531.00a2bf20@pop3.xtra.co.nz>
Content-Type: text/plain
Message-Id: <1050505378.28591.114.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 16 Apr 2003 16:02:58 +0100
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

On Mer, 2003-04-16 at 14:15, Gavin Hubbard wrote:
> Before anyone loses too much sleep over this, the Precisionbook has
> internal SCSI-IDE bridges that sit between the HBA and the drives. I
> believe a similar system was used in some of the earlier Apple Powerbooks.

So htf do they end up on the IDE controller too ? If they show up on the
scsi bus under Linux then I need the ssvid/ssid for the CMD device (and
which CMD variant is used) and I can vanish it easily enough.
