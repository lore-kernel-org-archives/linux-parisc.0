From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] SCSI (?) bug
Date: Sat, 6 Jan 2007 14:22:33 +0100
Message-ID: <7d01f9f00701060522p5b52fe47m290cad4fd0aadf1c__2922.75086180798$1416624253$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

pa-ckers

So the scsi bug that struck Jeff, Kyle and myself on A500 eventually
killed my rp3440. Here's the console dump:

http://www.pateam.org/archive/dumps/scsibug.txt

It basically renders SMP boxes useless. The last unaffected kernel was
2.6.18-rc1-pa3.

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
