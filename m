From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] The parisc SMP boot problem
Date: Sun, 18 Feb 2007 14:27:18 -0600
Message-ID: <1171830438.3423.26.camel__167.795716743235$1416624300$gmane$org@mulgrave.il.steeleye.com>
References: <1171820653.3423.22.camel@mulgrave.il.steeleye.com>
	<20070218193237.GB22043@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070218193237.GB22043@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-18 at 14:32 -0500, Kyle McMartin wrote:
> Any idea what was wrong with it?

Not yet ... the fact that everything goes OK for a while then hangs
implies there's some issue with handling the SID wrap around, but I
can't pinpoint it yet.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
