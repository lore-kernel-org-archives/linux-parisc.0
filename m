Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 11 Aug 2003 10:00:09 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Thibaut VAR?NE <varenet@esiee.fr>
Cc: knaresh@india.hp.com,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Affined IRQs.
Message-ID: <20030811160009.GD20405@dsl2.external.hp.com>
References: <3F378CFE.2A12407@india.hp.com> <DE031C48-CC01-11D7-94DE-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <DE031C48-CC01-11D7-94DE-0030656F07A2@esiee.fr>
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

On Mon, Aug 11, 2003 at 03:44:02PM +0200, Thibaut VAR?NE wrote:
> For instance, on A500, IRQs are distributed to both CPUs, on J5000, 
> only one of the two CPUs gets all IRQs.

I'm pretty sure this is a bug in the j5000 (Legacy PDC) init sequence.
Not a limitation of the j5000 HW.

> but to my understanding IRQs won't probably be serviced by 
> another CPU unless the IOSAPIC is reprogrammed to do so.

correct.

grant
