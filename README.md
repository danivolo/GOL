# GOL
Esploriamo le applicazioni della caoticità degli automi cellulari alla crittografia.

## Presentazione
Una [presentazione](https://1drv.ms/p/s!Ai4UpOWgiwLEqkcNpdKv7rPl_6n8?e=qhNEvU) con 

- Breve storia degli automi cellulari (Von Neumann)
- Breve storia di Game of Life
- Completezza di Turing: macchine di Turing in Rule 110 e Life
- Classificazione di Wolfram della complessità
- Metriche sulla complessità: articolo dei brasiliani
- **Un PRNG** a partire da Fredkin, un automa cellulare altamente caotico
- **Un algoritmo di crittografia per le immagini** basato su Life (e/o Fredkin)

## PRNG

FredkinPRNG.m è un generatore di stringhe binarie pseudocasuali che funziona srotolando successivi stati derivati dall'evoluzione di un istanza di Fredkin.

Il seme iniziale è costituito da i due parametri necessari per far partire una mappa logistica, che genera una sequenza che, disposta a forma di quadrato, costituisce la configurazione iniziale dell'automa.

L'output del PRNG può venir convertito con Bin2Thirtytwo.m in una sequenza di interi unsigned 32-bit, il formato solitamente accettato da software per il benchmark di PRNG come [dieharder](https://linux.die.net/man/1/dieharder).

L'obiettivo è testare e/o modificare questo PRNG in modo da passare almeno qualcuno dei test di dieharder.

## Encrypter

Encoder.m disordina i pixel di un'immagine a partire da una password, costituita ancora dai parametri di una mappa logistica. 

La password genera una configurazione iniziale di un automa cellulare, che viene fatta evolvere, e l'intera storia dell'automa viene usata per permutare i pixel secondo Permute.m.

Successivamente si effettuano dei test statistici di correlazione tra immagini iniziali e finali, e di sensibilità dell'immagine criptata rispetto a un piccolo cambiamento nella password.

# Riferimenti:
Gli articoli nelle cartelle
