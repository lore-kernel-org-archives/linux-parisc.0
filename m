From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: [parisc-linux] Userland relocation problems resolved (was: kernel
	module relocation bug)
Date: Thu, 2 Dec 2004 22:54:07 +0100 (MET)
Message-ID: <200412022154.iB2Ls8ci007096@arbas.nms.ulrich-teichert.org>
References: <200411292346.iATNk8hq003726@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200411292346.iATNk8hq003726@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Nov 29, 2004 06:46:08 PM
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

[del]
>Binutils 2.15, gcc 3.3.4.  No.

Right. Now it builds OK and passes most of the tests. The build finished
about two hours ago (on a B1000 - I don't have enough RAM).
I too have the problem of hanging 'expect' processes - now that I have a
new compiler, I should go for a newer kernel as well, I suppose ;-)

Thanks to all,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Suicide Drive (The Deep Eynde)
24539 Neumuenster, Germany|Public Pervert (Interpol) Clé De Contact (Metal Urbain)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
