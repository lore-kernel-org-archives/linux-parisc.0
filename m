From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] /proc/stat became wrong during 2.6.10-pa6 pa7
	transition???
Date: Thu, 3 Feb 2005 08:38:06 +0100
Message-ID: <41DE9360000085A1@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
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

Hello all,

I previously mentioned that top didn't report anymore right values since
2.6.10-pa7:
...
Cpu(s):  0.7% us,  0.0% sy,  0.0% ni,  0.0% id,  0.0% wa, 99.3% hi,  0.0%=

si
...

while 2.6.10-pa6 was seems more relevant:
...
Cpu(s):  0.7% us,  1.0% sy,  0.0% ni, 98.4% id,  0.0% wa,  0.0% hi,  0.0%=

si
...

and btw I noticed that strange stat reports too:
2.6.10-pa6 # cat /proc/stat
cpu  23248 3356 64981 4508884 30377 0 147
cpu0 23248 3356 64981 4508884 30377 0 147
...
i.e. 7 field ok
OTC
2.6.10-pa7 # car /proc/stat
cpu  88358 16430 0 0 0 33813422 0 0
cpu0 88358 16430 0 0 0 33813422 0 0
...
fwfw _8_ field ???

while src (afaik fs/proc/proc_misc.c:show_stat()) doesn't change at all:
...
        seq_printf(p, "cpu  %llu %llu %llu %llu %llu %llu %llu\n",
                (unsigned long long)jiffies_64_to_clock_t(user),
                (unsigned long long)jiffies_64_to_clock_t(nice),
                (unsigned long long)jiffies_64_to_clock_t(system),
                (unsigned long long)jiffies_64_to_clock_t(idle),
                (unsigned long long)jiffies_64_to_clock_t(iowait),
                (unsigned long long)jiffies_64_to_clock_t(irq),
                (unsigned long long)jiffies_64_to_clock_t(softirq));
        for_each_online_cpu(i) {

                /* Copy values here to work around gcc-2.95.3, gcc-2.96 *=
/
                user =3D kstat_cpu(i).cpustat.user;
                nice =3D kstat_cpu(i).cpustat.nice;
                system =3D kstat_cpu(i).cpustat.system;
                idle =3D kstat_cpu(i).cpustat.idle;
                iowait =3D kstat_cpu(i).cpustat.iowait;
                irq =3D kstat_cpu(i).cpustat.irq;
                softirq =3D kstat_cpu(i).cpustat.softirq;
                seq_printf(p, "cpu%d %llu %llu %llu %llu %llu %llu %llu\n=
",
                        i,
                        (unsigned long long)jiffies_64_to_clock_t(user),
                        (unsigned long long)jiffies_64_to_clock_t(nice),
                        (unsigned long long)jiffies_64_to_clock_t(system)=
,
                        (unsigned long long)jiffies_64_to_clock_t(idle),
                        (unsigned long long)jiffies_64_to_clock_t(iowait)=
,
                        (unsigned long long)jiffies_64_to_clock_t(irq),
                        (unsigned long long)jiffies_64_to_clock_t(softirq=
));
        }
...

any idea?

Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
