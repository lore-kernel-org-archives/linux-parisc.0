From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] strange top behaviour (since around 2.6.10-pa6?)
Date: Mon, 10 Jan 2005 18:19:54 +0100
Message-ID: <41DE941900000C88@mail-5-bnl.tiscali.it>
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

Hi all,

I just noticed this change of top behaviour (and related gkrellm ...):
top - 11:53:24 up 50 min,  2 users,  load average: 4.09, 3.67, 2.78
Tasks:  67 total,   5 running,  62 sleeping,   0 stopped,   0 zombie
Cpu0  : 88.5% us,  0.0% sy,  0.0% ni,  0.0% id,  0.0% wa, 11.5% hi,  0.0%=

si
Cpu1  : 94.8% us,  0.0% sy,  0.0% ni,  0.0% id,  0.0% wa,  5.2% hi,  0.0%=

si
Mem:   4106296k total,   159832k used,  3946464k free,    16836k buffers
Swap:   250872k total,        0k used,   250872k free,    78568k cached

This example came from the smp 64bit runing on n4k but the same on 32bit
on b2k and b180:
sy, ni, id, wa, si vlaues are constanly =3D=3D 0

Do I have to rebuild those tools localy to take into acount of the recent=

kernel changes?

Tia,
    Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
