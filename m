Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE2F44829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Oct 2002 19:06:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 181GAZ-0005Gr-00; Tue, 15 Oct 2002 02:06:47 +0100
Date: Tue, 15 Oct 2002 02:06:47 +0100
From: Matthew Wilcox <willy@debian.org>
To: Christian_Ehlers@gmx.de
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] G50 support
Message-ID: <20021015020647.A8660@parcelfarce.linux.theplanet.co.uk>
References: <18069.1034611875@www43.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <18069.1034611875@www43.gmx.net>; from Christian_Ehlers@gmx.de on Mon, Oct 14, 2002 at 06:11:15PM +0200
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

On Mon, Oct 14, 2002 at 06:11:15PM +0200, Christian_Ehlers@gmx.de wrote:
> Hi, I recently asked varenet@esiee.fr  if you support the HP 800/G50 9000
> server. He told me that this is not the case and that I should set up a network
> access to it so someone could work on it if they wanted to. Now I wanted to
> know if there is someone who would like to do this. 

Support for this box is going to be quite hard.  Here's the device list:

TNova (887, 897, 987) (Processor)  (PA7100/PA7150 (PCX-T))
Nova (Memory)
Miura LAN/Console (J2146A) (B DMA) (x2) (Undocumented driver)
Wizard SCSI (A DMA) (x2)
ACC Mux (AMSO) (A DMA) (x2)
Sahp Baat Kiuh SCSI (A DMA) (Undocumented driver)
Skunk Centronics (28655A) (A Direct) (Undocumented driver)
Sahp Baat Kiuh AP/MUX (A Direct) (Mux driver)

Miura Lan & ACC Mux seem to be a one-of-a-kind devices.  Wizard & Sahp
Baat Kiuh SCSI and the Skunk Centronics devices will likely be supported
by those working on K/E class support.  Sahp Baat Kiuh AP/MUX should
already work.

-- 
Revolutions do not require corporate support.
