From: "Max Grabert" <parisc@gmail.com>
Subject: Re: [parisc-linux] Debian Etch RC1 on B180L / X display problem
Date: Thu, 23 Nov 2006 14:22:58 +0000
Message-ID: <e6eae0290611230622s265d1eb4heae4d760f0b1e3e9@mail.gmail.com>
References: <200611222359.kAMNxbBp022646@stephenson.dhis.org>
	<20061123133925.GA12617@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061123133925.GA12617@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 23/11/06, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Thu, Nov 23, 2006 at 12:59:35AM +0100, Jean-Pierre HOFER wrote:
> > The X display shows only a grey surface with some horizontal white dotted
> > lines. The mouse pointer is a series of horizontal white lines. There is
> > no colour at all.
>
> X (and Linux fbdev in general) is incapable of configuring HP graphics cards,
> only driving them through the documented STI commands.
>
> You likely want to change the Monitor type to something else in "CO MO" at
> the PDC prompt.

I changed my screen resolution//refresh rate in X by using fbset
(before you start X), and having a matching modeline entry in
XF86Config/xorg.conf (see fbset -x).
Works for me, but for some strange reason not for every case (ie. not
all resolutions/refresh rates supported by fbset)

Slan,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
