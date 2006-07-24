From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sun, 23 Jul 2006 22:39:22 -0400
Message-ID: <7d01f9f00607231939x50741ff4le79858bad05b5cd8@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<7d01f9f00607221801v256dd541l152a85d7624a8d5b@mail.gmail.com>
	<200607231128.45454.mszick@morethan.org>
	<7d01f9f00607231503j7943b075ub6d98f0d5f9c3162@mail.gmail.com>
	<20060724014058.GA5542@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060724014058.GA5542@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/23/06, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sun, Jul 23, 2006 at 06:03:47PM -0400, Thibaut VARENE wrote:
> > That box hit the "kill your fs" bug I've seen on ppc and ia64
> > (upcoming report mail to be posted soon) so it's basically dead at
> > that point and I'm having hard time reinstalling it (thanks to pa8800
> > being /such/ a hassle to install remotely).
> >
>
> Does it have two disks? Maybe we should keep one disk as 'known good'
> backup on ioz and magnum, and if they crap out, BO ALT and dd it over
> the scrogged disk? Just a thought which might save some pain in the
> future considering they are crash n' bash machines.

It /had/ two disks and one good backup. Until I ran (for my own shame
and that of my offsprings) '# rm -rf /mnt *' on the backup one...

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
