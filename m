Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CD4A4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Apr 2003 10:58:24 -0600 (MDT)
Date: Mon, 7 Apr 2003 09:54:41 -0700
From: Randolph Chung <randolph@tausq.org>
To: bruno_vidal@hp.com
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] New dump driver patche.
Message-ID: <20030407165441.GB12993@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E91A30E.5750D22D@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E91A30E.5750D22D@hp.com>
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

> For who  want it, I've prepared a new patch for the dump driver.
> What's new:
> -can dump only used pages.
> -fully support multi volume dump.
> -can create dump in format image for use with p4 tools.
> 
> Bug correction:
> -missed pages when writing dump header.
> 
> I would be happy to send to everyone who want it.

is this against 2.4.20 or 2.5? can we post it on ftp.parisc-linux.org?

i'm very interested in this :)

thanks
randolph
