Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB807484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 08:53:57 -0700 (MST)
Date: Mon, 26 Jan 2004 08:53:56 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
Message-ID: <20040126155356.GA12175@colo.lackof.org>
References: <20040126021508.GZ1060@baldric.uwo.ca>
	<200401260235.i0Q2Z783024373@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401260235.i0Q2Z783024373@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Jan 25, 2004 at 09:35:07PM -0500, John David Anglin wrote:
> Is this on a SMP kernel (i.e., could this be a locking issue)?

no. I don't build or run SMP kernels on anything at the moment.

thanks,
grant
