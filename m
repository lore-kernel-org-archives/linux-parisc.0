From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workqueue.c:132
Date: Wed, 19 Jan 2005 09:21:22 +0100
Message-ID: <41DE92B500003975@mail-3-bnl.tiscali.it>
References: <20050119074927.GB3879@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Grant Grundler" <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050119074927.GB3879@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[...]
> Linux version 2.6.9-rc1-pa0 (jejb@gsyprf11.external.hp.com) (gcc versio=
n
> 3.0.4) #4 SMP Mon Aug 30 07:58:13 PDT 2004
What's up with 2.6.11-rc1-paX with gcc-3.3?

[...]> Enabling PDC_PAT chassis codes support.
> Releasing cpu 1 now, hpa=3Dfffffffffe781000
> FP[1] enabled: Rev 1 Model 20
> Releasing cpu 2 now, hpa=3Dfffffffffe798000
> FP[2] enabled: Rev 1 Model 20
> Releasing cpu 3 now, hpa=3Dfffffffffe799000
> FP[3] enabled: Rev 1 Model 20
> CPU(s): 4 x PA8800 (Mako) at 999.999700 MHz
Just by curiosity: is that 4 cpus or 2 dual core?

Is it booting in UP (either kernel or cpu deconfigure if possible ?)

Thnaks,
    Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
