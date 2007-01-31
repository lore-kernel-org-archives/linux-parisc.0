From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] an ultimate question about "at least 7 insn"
Date: Wed, 31 Jan 2007 11:00:38 +0100
Message-ID: <JCQ952$77E869952C796B32BB4B0FAD30F577E3__47705.8802884587$1416624635$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: "grundler" <grundler@parisc-linux.org>
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

Hello Grant,

Some time ago we spoke about some programming note like in pa11_acd.pdf:
[snip]
Software may rely upon this instruction translation in order to improve
performance in process dispatch. For example, in this code sequence:
    SSM 0,gr0       ; initial RSM, SSM or MTSM
    LDW             ; set up process state
    .               ; must be at least 7 instructions
    .               ; between the system mask instrs
    .
    LDW
    RSM 8,gr0       ; set PSW Q-bit to 0
    MTCTL reg1,cr20 ; set up IIASQ
[snip]

My question: is that request of 7 insn is hard-coded somewhere in silicon=
 or
much more a logical value because of cache line size (e.g. 32 byte on a d=
380
and as an insn is 32 bit wide =3D=3D 4 byte)? 

Why? because I noticed that recent system like n4k seems to have a bigger=

cacheline (according jda patch 64 byte), though.

Tia,
    Joel---=0AScarlet One - Combinez l'ADSL avec la telephonie fixe illim=
itee et epargnez 400 euros=0Ahttp://www.scarlet.be =0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
