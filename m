From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Mon, 19 Feb 2007 13:21:12 -0500
Message-ID: <20070219182112.GA32148__9642.85473241962$1416624306$gmane$org@athena.road.mcmartin.ca>
References: <119aab440702190834p36f92f95ue4ded14fa5a25a5@mail.gmail.com>
	<200702191656.l1JGuVkq018705@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702191656.l1JGuVkq018705@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 19, 2007 at 11:56:30AM -0500, John David Anglin wrote:
> > What hardware are you using?
> 
> This is pa8800 (Mako) at 800 MHz.
> 

Keep in mind James pointed out that while he fixed the primary source of
corruption, there still might be second-order problems...

John, what's the fastest non-PA8800 machine you have right now? Would a dual
750MHz j6700 help you?

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
