Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC561482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 12:35:30 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5A7FFB00C; Thu, 18 Oct 2001 19:35:36 +0100 (BST)
Date: Thu, 18 Oct 2001 19:35:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Richard Allen <ra@hp.is>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] More on the B2000
Message-ID: <20011018193535.T11105@linuxcare.com>
References: <ra@hp.is> <200110181732.LAA02640@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110181732.LAA02640@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Thu, Oct 18, 2001 at 11:32:30AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 18, 2001 at 11:32:30AM -0600, Grant Grundler wrote:
> I'm helping get IDE-CDOM working and I have also started work on
> getting the built-in narrow scsi working (sym53c8xx driver needs
> to make a PDC GET_INITIATOR call).

The narrow scsi works provided you boot with "sym53c8xx=buschk:2" as
per the CD errata though, doesn't it?

Richard
