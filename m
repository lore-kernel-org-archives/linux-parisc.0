Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id A78B0497B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Apr 2004 17:33:37 -0600 (MDT)
Date: Thu, 15 Apr 2004 17:33:36 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Jens_Konrad/Linotype/DE@linotype.com
Subject: Re: [parisc-linux] Problem with SCSI in K-Class
Message-ID: <20040415233336.GA12667@colo.lackof.org>
References: <OF18825705.F1E7C8A9-ONC1256E77.0068D1BD-C1256E77.0068D3C8@fonts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OF18825705.F1E7C8A9-ONC1256E77.0068D1BD-C1256E77.0068D3C8@fonts.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 15, 2004 at 09:04:59PM +0200, Jens_Konrad/Linotype/DE@linotype.com wrote:
> Now I took away the streamer and replaced it with a 50GB SCSI...
...
> My guess is that the low voltage scsi-controller cannot handle the
> size of the HD - could that be??

No. I'm using 73GB drives on my C3000 w/no problem.
Something else is wrong related to the driver stack.
Ryan already asked the obvious question: which kernel version?

grant
