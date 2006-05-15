From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Mon, 15 May 2006 07:53:04 -0400
Message-ID: <20060515115304.GA30488@skunkworks.cabal.ca>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
	<1147539787.6632.7.camel@mulgrave.il.steeleye.com>
	<yq0ves7psaw.fsf@jaguar.mkp.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Jes Sorensen <jes@sgi.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <yq0ves7psaw.fsf@jaguar.mkp.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 15, 2006 at 05:10:15AM -0400, Jes Sorensen wrote:
> 
> What about setting an ELF flag or somesuch, set a task flag based on
> this and then only do the extended register file backup for these
> apps?
>

There are bits in the PA ELF supplement for stuff like this, for
example you can certainly have a PARISC2_0 ELF32 object file.

I proposed doing exactly this when it was first brought up. There is a
slight snag though, it could get icky internally... Whoever volunteers
to do it would certain be in for some fun in entry.S amongst other places.
Probably more effort than it is worth in other words. On the other hand
the work in the same areas is probably needed to ever support HPUX 
ELF binaries.

Cheers!
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
