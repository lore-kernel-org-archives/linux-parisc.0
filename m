From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: More questions [Was: [parisc-linux] 2.6.10-rc1-pa11 profile data]
Date: Tue, 7 Dec 2004 15:42:18 +0100
Message-ID: <418A81310000D1B9@mail-7-bnl.tiscali.it>
References: <20041203154159.GB6359@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041203154159.GB6359@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,

> 
> 
> > I test it on my b2k with 64bit kernel and it works but it didn't seem=
s
> to 
> > bring me any benefit?
> > As far as I can believe readprofile: the ratio between the first and
last
> 
> > column is always the same (1/80 in this case).
> > What did I miss?
> 
> what workload did you test this on? possibly you only see a benefit wit=
h
> workloads that need to do a lot of page clearings.... so you probably
> want to find a workload so that the first column is >>1
> 
I re-do the following test with 2.6.10-rc3-pa2 with this b2k and 64bits
kernel:
readprofile -r ; make V=3D1 vmlinux 2>&1 | tee /var/logs/k-2.6.10-rc3-pa2=
-b2k64
; readprofile > /var/logs/prof2b-2.6.10-rc3-pa2-b2k64-3

I build first the kernel from cvs and reboot it to obtain following resul=
t:
/var/logs/prof2b-2.6.10-rc3-pa2-b2k64-3: 15500 __clear_user_page_asm   
                138.3929 (i.e. 1/112)

I apply previous mentioned lclu patch, rebuild again and reboot to rebuil=
d
a 4th time this kernel to obtain:
/var/logs/prof2b-2.6.10-rc3-pa2-b2k64-4: 12609 __clear_user_page_asm   
                112.5804 (i.e. 1/112)

Interesting: the ratio stay cst between test but the number of clock tick=
s
was well reduced (so I presume a potential benefit even though small ;-)

hth,
    Joel


-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
