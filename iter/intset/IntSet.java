package intset;

import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;

/**
 * @author fhussain
 * @version 0.38
 */
public class IntSet {

    //rep invariant: \forall i, j: (0 <= i < j < size) => (elems[i] != elems[j])

    //the elements of the set                                          
    private int elems[];

    //number of elements in the set                                    
    private int size;


    //default initial capacity of the set                              
    private static int INIT_CAPACITY = 5;

    //when size reaches capacity, increase capacity by this amount     
    private static int RESIZE_LEN = 10;
    

    // SAFE constructor
    public IntSet() {
	elems = new int[INIT_CAPACITY];
	size = 0;
    }

    
    // !BAD! -- this constructor exposes the rep
    // by making  a mutable argument object part of the rep
    // public IntSet(int[] sarr) {
    // 	elems = sarr;
    // 	size = sarr.length;
    // }

    //safe constructor
    public IntSet(int[] sarr) {
	boolean sawZeroYet = false; //zero is a unique case as dynamic allocation fills the array with 0s
		
    	elems = new int[sarr.length]; //not efficient if there are lots of duplicates
    	size = sarr.length;
	int idx = 0;
	for (int i = 0; i < sarr.length; i++) {	    
	    if ((!sawZeroYet && sarr[i] == 0) || !isIn(sarr[i])) {  //never insert duplicates
		if (sarr[i] == 0)
		    sawZeroYet = true;
		elems[idx] = sarr[i];
		idx++;
	    }
	    else {
		size--;
	    }
	}
    }


    /**
     * @return an array containing a copy of the {@code IntSet} 
     */        
    public int[] getAll() {
	//return this.elems;     // exposes the rep -- !BAD!
	return Arrays.copyOf(this.elems, size); //safe -- doesn't expose the rep
    }


    /**
     * @param e An element to be inserted in the {@code IntSet}
     */    
    public void insert(int e) {
    	if (find(e) == -1) {
    	    doinsert(e);
    	}
    }
    

    //  insert that doesn't check for duplicates -- !BAD!
    // public void insert(int e) {
    // 	doinsert(e);
    // }


    /**                                                                
     * checks the rep invaraint for this {@code IntSet}                
     * @return true if the rep-invariant holds, false otherwise        
     */  
    public boolean repOK() {
	for (int i = 0; i < size; i++) {
	    for (int j = i+1; j < size; j++) {
		//System.out.println("[diag] going to compare " + elems[i] + " and " + elems[j]);
		if (elems[i] == elems[j])
		    return false;
	    }	    
	}
	return true;
    }



    /**
     * @param e element to be removed from the {@code IntSet}
     */
    public void remove(int e) {
	int locindex = find(e);

	if (locindex != -1) {
	    System.out.println("[Intset.remove: will delete " + e + ", (currently at locindex = " +  locindex + ")]");
	    for (int i = locindex; i < size-1; i++) {
		//System.out.print("[IntSet.remove: will move " + elems[i+1] + " to index " + i + "] ...");		
		
		elems[i] = elems[i+1];
	    }
	    
	    size--;
	    System.out.println("size reduced to " + size);
	} else {
	    System.out.println("[IntSet.remove: nothing to remove as " + e + " is not in the set.]");
	}
    }

    private void doinsert(int x) {
	if (size == elems.length) {

	    //not part of spec; just testing the implementation
	    //System.out.println("[IntSet: resizing from len " + elems.length + " to len " + (elems.length+RESIZE_LEN) +"]");

	    int[] tmp = Arrays.copyOf(elems, elems.length+RESIZE_LEN);
	    elems = tmp;
	    elems[size++] = x;
	} else {
	    elems[size++] = x;
	}
    }


    private int find(int x) {
	int loc = -1;
	for (int i = 0; i < size; i++) {
	    if (elems[i] == x)
		loc = i;
	}
	return loc;
    }

    /**
     * postcondition: \result == the number of elements in the {@code IntSet}
     * @return the number of elements in the {@code IntSet}
     */
    public int size() {
	return size;
    }

    /**
     * @param x finds if {@code x} is contained in the {@code IntSet}
     * @return true if {@code x} is contained in the {@code IntSet}, {@code false} otherwise
     */
    public boolean isIn(int x) {
	boolean ans = false;
	if (find(x) != -1)
	    ans = true;
	return ans;	    
    }

    /**
     * @throws EmptyException if the {@code IntSet} doesn't contain any elements
     * @return an arbitrary element from the {@code IntSet}
     */ 
    public int choose() {
	int rval = 0;
	if (size == 0)
	    throw new EmptyException();
	else {
	    rval = elems[0];
	    //rval = elems[size-1];

	    //https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadLocalRandom.html#nextInt--
	    //rval = elems[ThreadLocalRandom.current().nextInt(0, size-1)];
	    
	}

	return rval;
	    
    }

    /**                                                                
     * this is essentially the Abstraction Function for {@code IntSet}s                                                                      
     */
    public String toString() {
	//can't use Arrays.toString() due to padding 
	//return Arrays.toString(elems);

	String tr = "[";
	for (int i = 0; i < size; i++) {
	    tr += elems[i];
	    if (i < size-1)
		tr+= ", ";	    
	}
	tr += "] ";
	tr += "{size: " + size + "} ";

	tr += "(rep invariant check: " +  repOK() + ")";

	return tr;
    }

}




