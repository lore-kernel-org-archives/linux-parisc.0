From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] A500 died - 2.6.17-rc5-pa3
Date: Tue,  6 Jun 2006 18:44:39 +0200
Message-ID: <J0G6IF$8E8196C5ECDBEDBAB9061C5B2476E27F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "T-Bone" <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 6/5/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > > My a500 died last night, leaving nothing but this on the console:
> > > http://www.pateam.org/archive/dumps/softlockupa500crash.txt
> >
> > Same error as Joel reported a few months ago on n4k.  He can reproduc=
e
> > it running a stress test with a few days of running.
> 
> interestingly, i've been running LTP and had a few 'genload' processes
> left running that I killed in the day preceding the crash...
> 
mmm, not sure but seems related also to this:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/02528=
6.html>
[snip]
[<000000001016a910>] update_process_times+0x50/0x90 
[<00000000101269b8>] smp_do_timer+0x78/0x80 
[<000000001011b120>] timer_interrupt+0xd8/0x2f0 
[<000000001011bed8>] do_irq+0xd8/0x1e8 
[<000000001011c0c8>] do_cpu_irq_mask+0xe0/0x150 
[<0000000010107074>] intr_return+0x0/0x24 
[snip]

and related threads (next month too)

No?


Joel
=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
