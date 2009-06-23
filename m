From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Tue, 23 Jun 2009 07:39:37 -0400
Message-ID: <119aab440906230439k6a145ddfwd7f44f742260b93d@mail.gmail.com>
References: <20090620232927.GA21560@lackof.org>
	 <20090621000635.6824C4FC6@hiauly1.hia.nrc.ca>
	 <20090623063121.GA10963@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James.Bottomley@hansenpartnership.com, kyle@mcmartin.ca,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090623063121.GA10963@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 23, 2009 at 2:31 AM, Grant
Grundler<grundler@parisc-linux.org> wrote:
> On Sat, Jun 20, 2009 at 08:06:34PM -0400, John David Anglin wrote:
>> > In the meantime...if someone can explain this error I could build and test:
>> > fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict
>> >
>> > something to do with __setup(nfs_root_setup) but it's not obvious to me what.
>>
>> Google says see:
>> http://lkml.org/lkml/2009/5/26/329
>
> Thank you...removing the __initconst added by this change:
> -static match_table_t __initconst tokens = {
> +static const match_table_t tokens __initconst = {
>
> allows me to build. Is no one else building with NFSROOT enabled?

I boot directly from disk on both my test machines (a500, c3k).

Cheers,
Carlos.
