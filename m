From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Sun, 26 Dec 2004 05:04:40 -0500
Message-ID: <200412260504.40205.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_4yozB+Xdw98yPLC"
To: parisc-linux@parisc-linux.org
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

--Boundary-00=_4yozB+Xdw98yPLC
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

seems to be a new bug because building a 2.6.8.1-pa7 kernel with same .config 
works fine while a 2.6.10-pa1 panics ;(

find attached:
2.6.10-pa1-scsi-panic - dmesg output from scsi driver up through panic
2.6.8.1-pa11-dmesg - scsi dmesg output from a good kernel
config.bz2 - my .config from 2.6.10-pa1

build system:
gcc-3.3.5 + binutils-2.15.92.0.2
-mike

--Boundary-00=_4yozB+Xdw98yPLC
Content-Type: text/plain; charset="us-ascii"; name="2.6.10-pa1-scsi-panic"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-pa1-scsi-panic"

sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
elevator: using anticipatory as default io scheduler
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
 target0:0:6: Beginning Domain Validation
sym0:6: wide asynchronous.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target0:0:6: Domain Validation skipping write tests
 target0:0:6: Ending Domain Validation
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
  Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:9:0: tagged command queuing enabled, command queue depth 16.
 target0:0:9: Beginning Domain Validation
sym0:9: asynchronous.
sym0:9: wide asynchronous.
Backtrace:
 [<102a51a8>] sym_ppr_nego+0x44/0xe0
 [<1029d6ec>] sym53c8xx_intr+0x30/0x80
 [<10106ca8>] do_irq+0x158/0x160
 [<102424d4>] dino_isr+0xf0/0x100
 [<10106ca8>] do_irq+0x158/0x160
 [<10106dac>] do_cpu_irq_mask+0xfc/0x10c
 [<1010c068>] intr_return+0x0/0x14
 [<1022ab20>] idr_get_new_above_int+0x98/0x15c
 [<1017442c>] generic_permission+0xa8/0x1a0
 [<10162ca0>] shmem_symlink+0x1d8/0x244
 [<1017758c>] vfs_rmdir+0x12c/0x254
 [<10112744>] cpu_idle+0x38/0x3c
 [<10440804>] start_kernel+0x1b8/0x1e4


Kernel Fault: Code=13 regs=10434640 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  00000000 ffffffff 104345c8 00000000
r04-07  10fbd000 00000000 00000010 00000001
r08-11  0000000a 10fbd310 00000009 00000000
r12-15  103ff810 00000000 000000fd f0100000
r16-19  10434140 f0000154 f000014c 02625a00
r20-23  fffffffc 00000000 ffffffff 104345c9
r24-27  0000000a 00000000 01312cff 103d3010
r28-31  000000fa 10400188 10434640 102a0810
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1023112c 10231130
 IIR: b3202000    ISR: 10240001  IOR: 0d034630
 CPU:        0   CR30: 10434000 CR31: 10438000
 ORIG_R28: 00000000
 IAOQ[0]: $$divU+0xc/0x210
 IAOQ[1]: $$divU+0x10/0x210
 RP(r2): 0x104345c8
Kernel panic - not syncing: Kernel Fault
 <0>Rebooting in 3 seconds..

--Boundary-00=_4yozB+Xdw98yPLC
Content-Type: application/x-bzip2;
  name="config.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="config.bz2"

QlpoOTFBWSZTWWsPHssABYPfgEAQWOf/+j////C////gYBQ8AC+9vUhvtrqqNr2LbfAM3VhgFBoZ
sAaCgaypvd1V3Z17G961sjvb73fY8DTSCNANAmETIU8aU8mSaPQnoTxRoxHqCUEATIJoJpJtKep6
gGnpAAAGQANNNJpGgJoaTKg9Go09QaA0DRoDQACTSSIqfqJ6T9TRGj1MjQaaAwgAMgMgDKEgGTTQ
0BiNAAAAAAAAkSAQTEJhE0psoaABoAAAAdfx+j/jjSjCNoBWLaUWFZUgoVqHpn8cZpnq69KHmeCw
4eF3f5u2XbLutxY+Zoh6gSA7MytD0UxxepqPn5Zj0SVEVZ0KilWlI9LVmMqCwRBa1g2yiQWBslxW
wWstCkPdcRQFJi2xayFYBUVLUSVKNErWtEokWqNZshAxmWpaW0rCqgCyVowOKNos3dJjJFJ2cuIt
FRFStABZAOpgYLht7ms0by1xlThdOlZHVVCtNJWO2ii60TMjSoVK1haiNlRZbW2VqWjeDtlBTUqN
RnHLBUcZesznx654dc88nWvb+T4e/5+xKp1H2PNyqiIEASvVRQngoFxg69lFwmYB/h8aFDe5U6fR
pICjR6ZdHKGG3t85Jdxi6tYZZosy7MP9JH8kf9L776X2KoNTUiM3s7tOXHCvq7YoOd9dOmvclb+s
HiETZbOZspeiyXZFWmaC4yb+rDx9F94888P0Lfpt5vLjU35deDz/WDLm62+mE5e+yOq5+bUnNy/N
K5XH4GsbVFt2/DBP3zkwynldcJAZGM+Fy0WSt+mKr35+cXRW3zjVljJnk2mSe+A66a9+lJLfHjmJ
TDTrz0IMx9B26t30JT5lS0qsc7viHmjWpU4gjVJSs7ebzxOVsCybxXthRl886RlLxVrRr7oplJHb
q35CxdisY5vJm/b85C9mDJJJXsZLIsGR9J7jqdi31xeNMWMxeN5Byf7rxO579JDBu5apBXMJtZuF
0HPOkk0z9Zr9aTsOptmhNyLNuvYyiW1okMKM5M7HSm/bZNlFeQgmTKNz4vN0hLrsp34h64rmZ+G2
FG3pz5+jxPZ2q/tCIEAQ/P8XzRzQun8YvDMGAansUtqe3p0ufLjnUIimbzw9Cx+lIhQmdVRHE7SA
CARB3M5kgFUpF1zQmstJiPJWE9sS1sUdcP+zPXkw18O6eoW9lnUWVctGgE6+1e9lJ9waVA8C+LSx
CRPxpFGS7+dUKBqZ73shdfCbqhgg/3ZfYqfvjl9fo7vSPp5+LmfAwfbZf8o7DEfuRvEKIN/gql/G
bqwrrDdeG3hbq+qjLTheNev8H8dctYVG+FaoLBpufCdzHxcWcPxumtvkHvton2Yy3vjrlva/NG3y
0C5yg5eI0RLALQM6dxhVUGCdSFMe7NfSOLaVyl+kPdXbbW9NLvaWcMJ45hQ7Iej9psEgJf8JqSXX
xbZtp5pXTvKWDYMnWOgQzBYepxrD60wCA7LsRs2dMDukNMZd5Jr9fEZ99oQX10+5BDHlkMIIUAt9
28BOeiWKBbhKNtynCvdm4MBB3umZTvk6tmU0AE7qd0D7LB2t6MtAGUsDEYRxsXDy6cb67JMqqZfJ
auuvnn5m6QoXKqRovjxpgwU9KyQrV5ToYa6KM/LCeqydsjYmyZ9tfCJ600VtFF9kl5q45acI26b0
9zhOGZ4jO+VcaDa7hHhQluc7tOJZtoMnM/pnjeVd+soYqOyP6UikTqrN4W3UHJIcBHcaeFKtu2UN
qtLxL0bLPo38RuCJD7KkBI4eYyfDMaJIpTQrCVUT6zxUqicR8Seu+90FsLk97I6nH1bmSMdisNaZ
rJXpafaRSOgwfPJqvIhpZOSyLarCqc5cgwywcqinwztmn2PjRAC5EG8AwVVUUqchOV13htgJ9duj
ktIZhbr17p/hVU4o/PtaS8fW9arxRAWEPNqjJt82oN+Q0aRGjAWjs0AgcW83fEmucOHF2KvRNBPG
6OTdAaeQXsUL+NFnKyzVvaXvKS3JCjqhunq1856k+baRo9FYavJDkvE0FRgLVGj5lb7TkRCyyzTS
4qUHro2SHsDx6buO3s/edoAUFFYMFEEFFFUBYoKQRixiRWQYQUYKioMixUVBEFBEEFGMisAWAsAF
URRARgxUiRWKKjBYCoKDJBYAiDFQRkSpYLFVSQUBSIKiLBRBRYsgiRQYoLGMVIiiCMBmjmyHYZsl
yFL09GTtuokJyLCE53m4MJrntYqo9A7y4rHoaXHeFJQfO/spZURYeZdmvvKq5429BkmWlBvuw4U3
spXBpxrfFcN1rJbcklsZQVlrGW+Dexdiv1gJlB0EiByb548SyfNoDliCzTXu7WWGYyugESdDEO2Q
PY4UHSgSixG0R8XQGGB+azst9FEMfaAJERTecgiKSNKxIxDncuswwpkOlOWtdlMniHSgHy7WvHWv
BSr+ZkhjVd3NRZzrSMdBXgEIMre1kSE57PhryCQQydCwURVneyaDcS1B/GlO9OipLC6vAhx6D5N+
N2o0mF7TKm0kBNJize9xWkMX66vlEIxRkMbMPYPM779caa6j8TGVzC8rG1jboqBvjLl1KyYEWUIh
jfdT1EyNJAKZn9VQVxK4kWwx9cdcThtm0dwnP19O61BLiOOnNCAQetTI+USi1O7KC2aEdmlNlnG8
Cx5pcPD11r0rqeb7/Pu9Nvn1989+As1aRCl0gW0TRDQI5teA+DJEm11yHKPS8uqyTN4sr5xHftRU
v0VhI0bD2waIk574gezAqUQIq0JJFGCFhoSm0gFDEIRUNihovBJPChqBnweUj6WiVbQStAm2aQgk
DGKbQlg6xUGVtvoSnx5sSc8ZsZ8N6bFhhTfxg5EKDrtHk4TPE8zelKJWqTYormsOaY3v6uYOAQCD
Wlipz2txdFDVZKl6a3p0dBHsRx0xpVbVxXlRJW4+VCs7vY4us1MbcImGdpCDIkdJBJ2OcLDQVbGC
Cjz50vnu/N3y5N4ypTIkhfEeeMLLHbYdeWoFJmMKGqYhLd4aRJhZ4HNwwRyWDNo4po2Zn2Lzqa5d
2vJOh5iBpM9+qYFi4uIZqDPryi/dYGlDRJbUV0EP4s2Fuj0a7jvz7PE+FyfkZDFiJi5V7rzYdIg4
4vTz6WoE+r+nS/HjRGuJu8gCeXl0pHKRDfgmNlWY8KCpWDjLBiQ0kHN5GoNHBjHiWcMMMyvCcxWm
9qyNn4oeMvPzR11vjtsTZkM9YhJBZ27FDqTSvF7QL+nLPWZJPipldpBJSQOydZMKVQ3cDCoGsRde
qPOm88bsGhh3+HJPaAimrcuFomG0PcWD5xUrV6jOSgQpTWaKh54FB6ynCUABjL08K/xL5lbBR2gU
MbG0DakhAIIUIEmGWGWJDpBMbbHRAiFIlI005zAKlCuzBQz0xkwq1SnIdGpxP2nicJ9fAStNkM5A
ZW+OjvI3cmQz2xLqhT8M3qvgI9edybaa6dmwE82KXfPRux3aWMi2JKoL5eCjljRTPTPeU4GoidNJ
c2bnwncSAQZMoNI5tey6TN9Hy97ZGHzCpXYzsuBQycTjNEwqSO+RsW2QLJ7IOa5GRC6FkHHKBMba
XgZfrlDbznFTWN+UdqAi/SPLgy5z4QbCQzo0S03xzijZn7wiUUKBC56lCFftGO2nCl7zqpDPEZMM
kuR3gZGhu0DI5yiYX00LObwSJAmONOcoL0J7oE/BU29ADOwtHnKEIGNdUn9jzhI42hYLTDmwJzjk
5HSKCkrXqdp69CKSizMmEe01XviFpOBbXhB5qSJ5VTl0i1cbSTSND2rICZRF53mveIm87HfIullH
4S+GHKfeQ88m2Z0k2FOQmmUVLy803QI8zwjW47/PsdKNhTRQHdl6wdIbVLwgonMay3lJCjnL1vBd
ccW3mP4dYzj3qYbXs9t5rd4pGT3a5rffZ802iewxuVAzl2p2qdl/RqBJHEQUXrGrPTI6nrRbVR3I
DvaaAkGkSGjdlUobOlTuoo+gQVqwSIKtGhdJd0GrMUSF3Ck5Lk1Yzz4vBiJvFCLVqyDA+TVDEBs5
jPDR4GjEJIbNbNGzSOTDma1ErbUnWFRopEC6pLbxrJMxyOBnCBLwCqnwURSuVOVw56d4AuF4E5aY
xgyHl0jI4e6z6Fyck5J3Pe8hAOaJ9SWdJ5RXaORVHaaqTvbuescVXSdjPLc8qq0MFW12Sk9DELJf
YXxcgOiIUTUrCwamuIFSGkizmsnJUHmJxWSDk6UGGKXMGZ0fRmQ54taaoNusQ0NHCsKbMx3ExI0+
L6cNiiRR+6qhp7maLQ7BZCz1MwcUC/ytHnVAu1hsooJU5SJT4R04u2mUQYNsuhNTryImko2C/CKo
oiPQrwpMdBk8p6ypQp30IkoFgQEQALxc0NFnGIlJDR30NPHlCxk48DnsuonaiSu49L7M224OrWaM
yuA0LnAIpanf09XXAIfV6xxWG6Ey6YYZRVz54W5q1ujdFSMQTmWUOrVT1QL6Is5lmZrBlpnyBrpk
VgNnr8bd52fzG1YW/vCXtFBNyTB8Ym9cJTb4Q068unrmRdK9ArSi8yDvXlOck7XmSV2CLtFXvWZ4
vQVYhF/lGtIuIhbGmDt01+V/l1tAj3sp59TU6qeVREOOeeY3JEuJRIobYWU0xWYNjZ6VnzZbEcR0
l6NKREKr0II6KE7kQGHOzszDCLtI3EO2NjZeSbNY9i3YskxFhoKYHfzxZNSHOJaFXRsTaYFjM2DG
pcilCEPduq19JjnDc7QKTFeIDNoHcgA4aBdqqJ3foSJNIRmCejRU2gk5DQW6xqyy0vKt4aOBnsdG
Yg3dU0kx1s8yZk6OdHQAzxm+wpr5lI2JOObL9YRNDDDOQ66m2CUPimTQiwwNTtKqKCKoqqqiCgqh
QJBQCccPRcLnieNX51vqxUDChZe67qYVB+YTnu9Emhbj1d+GTbMfaIhHqK6mhf7KQU3mPfUajtno
+YEukRzNPfnBEREOKuw+gXYRMkVRs7tf6OXRs+GgWfHEaasoZNjswlVEI37clXcnxwWyYCh1Kgww
5uZ57UoSMnGYIGliCJmEcCcapksM6rGYBZdGstKfH6/P2/r9x+PT2iC+rvwsJw6s/fvlnj82gfsT
43YMRXrbozxWLLQFhu/0ESMfdb82ptHEuj6yPt6wg8zgVxrz1+G+U65lomsA2VZERESKypUWbZnp
BXpKy3Qa++nnXtbjj25/grpr63i44mm7/5RnLGJFi8kN/Rnn5zsprjhHXXLFTetVtPZUNxCXY1c+
ZuopqgCC5EHpxJ/Vp0Vguy2+jMPjaA0auOIDQSECqrP6CThqOtDwbiG03mc1cTXvmQSbUncYP54c
HwDJA9UCt5fyjOSloUFYUjoIxbiEAXsby3FB3EkggcJRXqvKe1mZcKhW8JoSQjzl9eNRjMEQIAnM
Jh/ZHFOXGjEEgCUjOxTXw3Pe8OGJKEFbhr+Z9q6st2lR4NAPbRowunzr9E4xmTS+mkJH1pS2Rho2
c3qS6JycHSFuKizW5dTfJ39uBNQN+n5XBECAJ7EeiOeAsL8djmeO+oRr5mSu0f2w6W9dAAl63MeY
KEJBRMjNg8nGGq5Cg6CSpcEggG/IM1td91pT/k91+SIMcW87gKT6jM0hfFGTy4VK5UaGZRGfOV6u
94uzt0Q8nALy5Muwc3hh3vnVF4Q2Rh4PAetkaAzNhgku/rA2LljySHlIzOWsia0LhFJOCf18xfUS
ECfz1iRsfqaSEC4nnQ93pnEZnsA88gF2kQxAGEkMBCCzQCgyIb5S6iQgTCio6n4MSegGpvyL30H+
ZVu6XJCx7ippOT6b26PoqaFQTCkbZaXD1qHrmN/cNee1J5wwohIJQEolCBiWZv3jPYjnOxzG2zHA
HIomxgQCXnrQafYt+I3d4ARAMK6eQbpyWMwYNrc9CAT/4u5IpwoSDWHj2WA=

--Boundary-00=_4yozB+Xdw98yPLC
Content-Type: text/plain;
  charset="us-ascii";
  name="2.6.8.1-pa11-dmesg"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.8.1-pa11-dmesg"

sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18j
Using anticipatory io scheduler
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:6:0): Beginning Domain Validation
sym0:6: wide asynchronous.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
scsi(0:0:6:0): Domain Validation skipping write tests
scsi(0:0:6:0): Ending Domain Validation
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
  Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:9:0: tagged command queuing enabled, command queue depth 16.
scsi(0:0:9:0): Beginning Domain Validation
sym0:9: FAST-20 SCSI 20.0 MB/s ST (50.0 ns, offset 16)
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation detected failure, dropping back
sym0:9: FAST-10 WIDE SCSI 20.0 MB/s ST (100.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation detected failure, dropping back
sym0:9: FAST-10 WIDE SCSI 13.5 MB/s ST (148.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation detected failure, dropping back
sym0:9: FAST-5 WIDE SCSI 8.9 MB/s ST (224.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation detected failure, dropping back
sym0:9: wide asynchronous.
sym0:9:0:M_REJECT to send for : 1-3-1-57-10.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation detected failure, dropping back
sym0:9: wide asynchronous.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation detected failure, dropping back
sym0:9: wide asynchronous.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
scsi(0:0:9:0): Write Buffer failure 8000002
scsi(0:0:9:0): Domain Validation Failure, dropping back to Asynchronous
scsi(0:0:9:0): Ending Domain Validation
sym0:9: wide asynchronous.
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
  Vendor: TOSHIBA   Model: CD-ROM XM-5301TA  Rev: 1895
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi(1:0:2:0): Beginning Domain Validation
scsi1: (2:0) Asynchronous
scsi1: (2:0) Synchronous at offset 8, period 236ns
scsi(1:0:2:0): Domain Validation skipping write tests
scsi(1:0:2:0): Ending Domain Validation
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sdb: 17873040 512-byte hdwr sectors (9151 MB)
SCSI device sdb: drive cache: write back
 sdb: unknown partition table
Attached scsi disk sdb at scsi0, channel 0, id 9, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 9, lun 0,  type 0
Attached scsi generic sg2 at scsi1, channel 0, id 2, lun 0,  type 5
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f1ff0000 (64 kB), fb at f6000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1280

--Boundary-00=_4yozB+Xdw98yPLC
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_4yozB+Xdw98yPLC--
