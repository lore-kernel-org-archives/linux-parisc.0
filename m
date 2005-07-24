From: Karthik <molecularbiophysics@gmail.com>
Subject: Re: [parisc-linux] Debian hppa kernel panic - solved -
Date: Sun, 24 Jul 2005 10:21:56 +0200
Message-ID: <a015f9a00507240121418be05b@mail.gmail.com>
References: <a015f9a00507210135b8b9071@mail.gmail.com>
	<20050721130031.GD27330@colo.lackof.org>
	<a015f9a005072211286e926d2d@mail.gmail.com>
	<a015f9a005072211305665198b@mail.gmail.com>
	<20050722184332.GA11034@roadwarrior.mcmartin.ca>
	<a015f9a005072212031e9cb7df@mail.gmail.com>
	<20050722190917.GB11034@roadwarrior.mcmartin.ca>
	<a015f9a005072401206190bc37@mail.gmail.com>
Reply-To: Karthik <molecularbiophysics@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <a015f9a005072401206190bc37@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

So many thanks... Every thing up and running except my PS2 mouse

The soln:
http://www.debian.org/releases/stable/debian-installer/index#errata

K



> On 7/22/05, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > On Fri, Jul 22, 2005 at 09:03:40PM +0200, Karthik wrote:
> > > > You need to bump initrd_size.
> >
> > For one, you're asking on the wrong list. Since this is a Debian
> > problem.
> >
> > Second, get to the PALO prompt (answering yes to interact with the IPL,
> > or boot pri ipl) and add initrd_size=3D32768 to the path by choosing a
> > number available and adding that to the line which will create
> > a new entry.
> >
> > --
> > Kyle McMartin
> >
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
