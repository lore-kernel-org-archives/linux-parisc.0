Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 10 Jul 2003 17:55:31 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
Message-ID: <20030710235531.GB6200@dsl2.external.hp.com>
References: <20030710161243.GB30482@dsl2.external.hp.com> <Pine.LNX.4.44.0307101724300.8453-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0307101724300.8453-100000@sal.ucc.ie>
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

On Thu, Jul 10, 2003 at 05:29:49PM +0100, M. Grabert wrote:
> I got the machine with 2 terminators, a SE SCSI and (obviously) a LVD SCSI.
> I don't think it's a differential terminator.

Ok. Given the older 2.4.20 kernel with sym1 driver sees the
same issues, it stinks like a HW problem. And termination
was the most obvious starting point.

Try take the LVD drives out of the C3000 and re-seat them firmly.
It's also possible one of the LVD drives is dying.

And having zalon support enabled shouldn't be a problem.
It just won't get used on the C3000 since no zalon chips are present.

grant
