Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58B6E48D7
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 11:20:14 -0700 (MST)
Date: Thu, 20 Mar 2003 19:20:05 +0100
Message-ID: <3E689FC400004712@ocpmta1.freegates.net>
In-Reply-To: <03031617171601.01171@wolf466>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: mszick@goquest.com, "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Mike,

>On Sunday 16 March 2003 05:06 pm, Matthew Wilcox wrote:
>> On Sun, Mar 16, 2003 at 04:52:19PM -0600, Michael S. Zick wrote:
>> > On Friday 14 March 2003 07:17 am, Matthew Wilcox wrote:
>> > > net/core/rtnetlink.c:extern __inline__ int rtnetlink_rcv_skb(struct
>> > > sk_buff *skb)
>> >
>> > Stolen from the GCC thread on 3.x.x inlining...
>> > - - - - GCC - - - - -
>> > For the record, the kernel doesn't need this any more.  Go check 2.5;
>> > new versions of <linux/compiler.h> contain this line:
>> > #define inline          __inline__ __attribute__((always_inline))
>> > - - - - - - - - - - - -
>> > That forces GCC to ignore its changed inline metrics and simply inline
>> > the function.
>>
>> Yes, but...
>>
>>  * Joel's using 2.4, not 2.5
>Exactly why I mentioned it.
>
>>  * #define inline doesn't help functions which are marked as __inline__
>If he follows your suggestion of dropping the "__" around "inline" it will.
>
>>
>> This isn't a function which absolutely needs to be inlined.  It can
>> be `static inline' and gcc can do whatever it likes then.
>The subject is getting a lot of discussion on the GCC list.  I only mentioned
>this one workaround so that Joel could get on with his work before the issue
>is settled on the GCC list.
>
Good idea: I (just sorry for delay) back port this stuff for 2.5 and it works
fine.

Thanks a lot,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
