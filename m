From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Thu, 20 Mar 2003 19:06:36 +0100
Message-ID: <3E689FC400004700__10221.0540943362$1416622312$gmane$org@ocpmta1.freegates.net>
References: <3E68A24B00000CC9@ocpmta6.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: "Matthias Klose" <doko@cs.tu-berlin.de>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <tausq@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E68A24B00000CC9@ocpmta6.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Randolph,

>>
>>> I am looking to rebuild gcc-3.3 64bits to rebuild the last kernel 2.4
>to
>>> conitnue my investigation about smp(64bits) [which failled to boot on
>a
>>N4000
>>> when compile d with gcc-3.2 get from unofficial-debs].
>>
>>If you are working on 64-bit, I would advise staying with 3.0.4 for
>>now.... no one has tested 3.3 hppa64-linux-gcc at all, so it will just
>>be introducing more unknowns into the problem.
>>
>Ok I am gonna try to rebuild it with gcc-3.0.
>
Well just a small follow up to say that I had not much success with gcc-3.0
(64bits).

Also I did some other test:
this same kernel (smp64) boots well on a b2k (pa8600 up),
it boots also well on the N4000 when I 'disable' the second cpu?

(It seems to fail before 'Add swap...' but not sure because I notice that
all boot blabla is not output to the console [ie compare to dmesg nothing
is print out before 'sym53c8xx: at PCI...']?)

I will so try to ack dump_analyser to see how may I got analyse of the piminfo
which I grab from the two processor.

See you,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
