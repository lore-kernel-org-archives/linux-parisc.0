Return-Path: <taggart@carmen.fc.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9D334852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 20 Feb 2004 18:44:52 -0700 (MST)
To: Razvan Popescu <tomcatsniper@go.ro>
Subject: Re: [parisc-linux] Install from DDS Tape 
In-Reply-To: Your message of "Sat, 21 Feb 2004 03:19:17 +0200."
	<5818350927.20040221031917@go.ro>
References: <5818350927.20040221031917@go.ro> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Feb 2004 18:44:44 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20040221014445.D682A37D0C@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Razvan Popescu writes...

> Hi,
>   I have an old HP 9000 model 715 at my work with HP-UX 10.2 and
>   I want to install Debian 3.0 for PA-RISC on it but it has ONLY
>   a dds tape drive (no cdrom, no floppy). My question is: Can I
>   install from tape?

Yes.

> How can I put the Debian ISO file on a dds and boot/install from that?

I'm not sure if dd'ing the ISO image will work. Just dd one of the 
installer lif images onto the tape.

-- 
Matt Taggart        Linux and Open Source Lab
taggart@fc.hp.com   Hewlett-Packard
