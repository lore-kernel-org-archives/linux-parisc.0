From: Jes Sorensen <jes@sgi.com>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Mon, 15 May 2006 12:56:16 +0200
Message-ID: <44685E50.7040908@sgi.com>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>	
	<1147539787.6632.7.camel@mulgrave.il.steeleye.com>	
	<yq0ves7psaw.fsf@jaguar.mkp.net>
	<7d01f9f00605150255u5846f144u9c95cab3ffd35133@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00605150255u5846f144u9c95cab3ffd35133@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut VARENE wrote:
> On 15 May 2006 05:10:15 -0400, Jes Sorensen <jes@sgi.com> wrote:
>> What about setting an ELF flag or somesuch, set a task flag based on
>> this and then only do the extended register file backup for these
>> apps?
> 
> If that's possible *and* acceptable, it might be very helpful indeed.

I don't know anything about the PARISC ELF specification, but I think
it ought to be feasible.

Alternatively, if you can trap the instruction so you get a kernel trap
the first time the user app tries to do this and then set the flag then.
Otherwise there is the problem that someone will do some hand tuned
assembly that uses the 64 bit regs and you end up with mocked up state
if this goes undetected.

Cheers,
Jes
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
