From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Problem with atomicity of TIF for parisc ?
Date: Sun, 11 Mar 2007 21:25:53 +0100
Message-ID: <200703112125.53971.deller__17606.0614445761$1416624325$gmane$org@gmx.de>
References: <200703092007.32746.deller@gmx.de>
	<200703100006.l2A06o7Y012173@hiauly1.hia.nrc.ca>
	<20070310140324.GA31586@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070310140324.GA31586@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 10 March 2007, Kyle McMartin wrote:
> On Fri, Mar 09, 2007 at 07:06:50PM -0500, John David Anglin wrote:
> > 
> > Is disabling interrupts sufficient on a SMP system?
> > 
> 
> No. :/

Hi Kyle,

Independend of the fact if irq-disabling is enough on SMP or not.
The question still remains: May this be one of the reasons we see the hangs ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
