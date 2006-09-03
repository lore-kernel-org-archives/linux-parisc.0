From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: Re: [parisc-linux] Latest palinux crash -- VM problem?
Date: Sun, 3 Sep 2006 11:08:42 +0200
Message-ID: <7d01f9f00609030208g602ac55fsfa0132aed011f4eb@mail.gmail.com>
References: <20060903050051.GA2558@parisc-linux.org>
	<20060903063015.GB2558@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060903063015.GB2558@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Please also review this report I posted a while ago:

http://www.pateam.org/archive/dumps/palinuxcrash20060827.txt

It looks much to me like a hardware problem. See in particular the
reported chassis log and the I/O Module Errors at the end of the dump.

HTH

T-Bone

On 9/3/06, Matthew Wilcox <matthew@wil.cx> wrote:
> On Sat, Sep 02, 2006 at 11:00:52PM -0600, Matthew Wilcox wrote:
> > The memory error log indicates an uncorrectable error, unfortuantely I
> > don't understand it enough to decode what it's saying.
> >
> > Could it be a different manifestation of the same problem that bites
> > PA8800?  That is, do we have the same address mapped twice and we're
> > upsetting Astro by writing back cachelines that are supposed to be on
> > the other CPU?
> >
> > I should probably try to find Astro docs at some point so I can find out
> > how much it cares about this kind of thing.
>
> OK, got the Astro docs.
>
> > Error Status Reg           = 0x0000000000000010
>
> This bit says that Astro observed a BROAD_ERROR transaction on the
> Runway bus.  ie Astro didn't cause the error, it only noticed it and
> went fatal in response.  It looks like CPU 0 sent the broadcast error,
> so I need to try to figure out what made CPU 0 go funny.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>


-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
